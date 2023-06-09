local enabledEnv = {}

local init = function(userConfig)
  table.insert(enabledEnv, require("nvim.env.common")(userConfig))
  -- if userConfig.lua.enable then
  table.insert(enabledEnv, require("nvim.env.lua")(userConfig.lua))
  -- end

  -- if userConfig.frontend.enable then
  table.insert(enabledEnv, require("nvim.env.frontend")(userConfig.frontend))
  -- end

  -- if userConfig.rust.enable then
  table.insert(enabledEnv, require("nvim.env.rust")(userConfig.rust))
  -- end
  -- if userConfig.bash.enable then
  --     table.insert(enabledEnv, require("insis.env.bash")(userConfig.bash))
  -- end
  -- if userConfig.json.enable then
  table.insert(enabledEnv, require("nvim.env.json")(userConfig.json))
  -- end
  -- if userConfig.yaml.enable then
  --     table.insert(enabledEnv, require("insis.env.yaml")(userConfig.yaml))
  -- end
  -- if userConfig.markdown.enable then
  --     table.insert(enabledEnv, require("insis.env.markdown")(userConfig.markdown))
  -- end
end

-- loop through enabledEnv list and call envFunc on each Env file
local function collectList(envFunc)
  local list = {}
  for _, env in ipairs(enabledEnv) do
    for _, p in ipairs(env[envFunc]()) do
      if table.indexOf(list, p) == -1 then
        table.insert(list, p)
      end
    end
  end
  return list
end

return {
  init = init,
  getFormatOnSavePattern = function()
    return collectList("getFormatOnSavePattern")
  end,
  getTSEnsureList = function()
    return collectList("getTSEnsureList")
  end,
  getLSPEnsureList = function()
    return collectList("getLSPEnsureList")
  end,
  getToolEnsureList = function()
    return collectList("getToolEnsureList")
  end,
  getLSPConfigMap = function()
    local configMap = {}
    for _, env in ipairs(enabledEnv) do
      for k, v in pairs(env.getLSPConfigMap()) do
        configMap[k] = v
      end
    end
    -- printTable(enabledEnv)
    return configMap
  end,
  getNulllsSources = function()
    return collectList("getNulllsSources")
  end,
  getNeotestAdapters = function()
    return collectList("getNeotestAdapters")
  end,
}
