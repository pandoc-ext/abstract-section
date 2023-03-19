--[[
abstract-section – move an "abstract" section into document metadata

Copyright: © 2017–2023 Albert Krewinkel
License:   MIT – see LICENSE file for details
]]
local stringify = (require 'pandoc.utils').stringify
local configuration = {
  abstract = 'abstract'
}
local collected = {}

--- Extract abstract from a list of blocks.
local function abstract_from_blocklist (blocks)
  local body_blocks = {}
  local looking_at_section = false

  for _, block in ipairs(blocks) do
    if block.t == 'Header' and block.level == 1 then
      if configuration[block.identifier] then
        looking_at_section = block.identifier
        collected[looking_at_section] = {}
      else
        looking_at_section = false
        body_blocks[#body_blocks + 1] = block
      end
    elseif looking_at_section then
      if block.t == 'HorizontalRule' then
        looking_at_section = false
      else
        local collect = collected[looking_at_section]
        collect[#collect + 1] = block
      end
    else
      body_blocks[#body_blocks + 1] = block
    end
  end

  return body_blocks
end

Pandoc = function (doc)
  local meta = doc.meta
  -- configure
  configuration = doc.meta['abstract-section'] or configuration
  -- unset config in meta
  doc.meta['abstract-section'] = nil

  local blocks = {}
  if PANDOC_VERSION >= {2,17} then
    -- Walk all block lists by default
    blocks = doc.blocks:walk{Blocks = abstract_from_blocklist}
  elseif PANDOC_VERSION >= {2,9,2} then
    -- Do the same with pandoc versions that don't have walk methods but the
    -- `walk_block` function.
    blocks = pandoc.utils.walk_block(
      pandoc.Div(doc.blocks),
      {Blocks = abstract_from_blocklist}
    ).content
  else
    -- otherwise, just check the top-level block-list
    blocks = abstract_from_blocklist(doc.blocks)
  end
  for header_id, metakey in pairs(configuration) do
    metakey = stringify(metakey)
    local abstract = collected[header_id]
    if not meta[metakey] and abstract and #abstract > 0 then
      meta[metakey] = pandoc.MetaBlocks(abstract)
    end
  end
  return pandoc.Pandoc(blocks, meta)
end
