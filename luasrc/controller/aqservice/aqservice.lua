module("luci.controller.aqservice.aqservice", package.seeall)  --notice that new_tab is the name of the file new_tab.lua
 function index()
 	if not nixio.fs.access("/etc/config/aqservice") then
		return
	end
	
	entry({"admin", "services", "aqservice"}, alias("admin", "services", "aqservice", "settings"), _("AQService"))
	entry({"admin", "services", "aqservice"}, cbi("aqservice/aqservice"), "AQService", 1) 
end