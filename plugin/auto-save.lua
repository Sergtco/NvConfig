local ok, save = pcall(require, "auto-save")

if not ok then
	return
end

save.setup {
    	 trigger_events = {"InsertLeave", "TextChanged", "CursorMovedI"}
}
