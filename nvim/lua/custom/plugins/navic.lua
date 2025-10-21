return {
  "SmiteshP/nvim-navic",
  dependencies = { "neovim/nvim-lspconfig" },
  event = "VeryLazy",
  init = function()
    -- Set global highlight groups early (optional but recommended)
    -- vim.highlight.create("NavicIconsFile", { default = true, link = "Directory" })
    -- vim.highlight.create("NavicIconsModule", { default = true, link = "Include" })
    -- vim.highlight.create("NavicIconsNamespace", { default = true, link = "Include" })
    -- vim.highlight.create("NavicIconsPackage", { default = true, link = "Include" })
    -- vim.highlight.create("NavicIconsClass", { default = true, link = "Structure" })
    -- vim.highlight.create("NavicIconsMethod", { default = true, link = "Function" })
    -- vim.highlight.create("NavicIconsProperty", { default = true, link = "Identifier" })
    -- vim.highlight.create("NavicIconsField", { default = true, link = "Identifier" })
    -- vim.highlight.create("NavicIconsConstructor", { default = true, link = "Special" })
    -- vim.highlight.create("NavicIconsEnum", { default = true, link = "Type" })
    -- vim.highlight.create("NavicIconsInterface", { default = true, link = "Type" })
    -- vim.highlight.create("NavicIconsFunction", { default = true, link = "Function" })
    -- vim.highlight.create("NavicIconsVariable", { default = true, link = "Constant" })
    -- vim.highlight.create("NavicIconsConstant", { default = true, link = "Constant" })
    -- vim.highlight.create("NavicIconsString", { default = true, link = "String" })
    -- vim.highlight.create("NavicIconsNumber", { default = true, link = "Number" })
    -- vim.highlight.create("NavicIconsBoolean", { default = true, link = "Boolean" })
    -- vim.highlight.create("NavicIconsArray", { default = true, link = "Constant" })
    -- vim.highlight.create("NavicIconsObject", { default = true, link = "Structure" })
    -- vim.highlight.create("NavicIconsKey", { default = true, link = "Identifier" })
    -- vim.highlight.create("NavicIconsNull", { default = true, link = "Constant" })
    -- vim.highlight.create("NavicIconsEnumMember", { default = true, link = "Constant" })
    -- vim.highlight.create("NavicIconsStruct", { default = true, link = "Structure" })
    -- vim.highlight.create("NavicIconsEvent", { default = true, link = "Identifier" })
    -- vim.highlight.create("NavicIconsOperator", { default = true, link = "Operator" })
    -- vim.highlight.create("NavicIconsTypeParameter", { default = true, link = "Type" })
  end,
  opts = {
    separator = " ➤ ",
    highlight = true,
    depth_limit = 5,
    depth_limit_indicator = "..",
  },
}