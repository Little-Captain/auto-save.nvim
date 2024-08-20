local TITLE = "auto-save"

return function(msg, kind)
	local has_notify_plugin = pcall(require, "notify")
	local level = {}

	if kind == "error" then
		level.log = vim.log.levels.ERROR
		level.type = "error"
	elseif kind == "warn" then
		level.log = vim.log.levels.WARN
		level.type = "error"
	else
		level.log = kind or vim.log.levels.INFO
		level.type = "info"
	end

	if has_notify_plugin then
		vim.notify(msg, level.log, {
			title = TITLE,
		})
	else
		vim.notify(("%s: %s"):format(TITLE, msg), level.log)
	end
end
