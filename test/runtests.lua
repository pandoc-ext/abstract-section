#!/usr/bin/env pandoc-lua
--- Run tests with perevir.
--
-- Copyright: © 2024 Albert Krewinkel <albert+pandoc@tarleb.com>
-- License: MIT

local perevir = require 'perevir'
local opts = perevir.parse_args(arg)
perevir.do_checks(opts)
