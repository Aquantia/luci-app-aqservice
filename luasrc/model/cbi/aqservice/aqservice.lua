m = Map("aqservice") -- cbi_file is the config file in /etc/config

s = m:section(TypedSection, "general", "General gaming options")
s.anonymous = true

e = s:option(Flag, "enabled", "Enable gaming service")
e.rmempty = false

function e.write(self, section, value)
	if value == "1" then
		luci.sys.call("/etc/init.d/aqservice enable")
		luci.sys.call("/etc/init.d/aqservice start")
	else
		luci.sys.call("/etc/init.d/aqservice stop")
		luci.sys.call("/etc/init.d/aqservice disable")
	end

	return Flag.write(self, section, value)
end

p = s:option(Value, "port", "Connection port")
p.rmempty = false

function p.validate(self, value)
	if(value == undefined or value == null) then
		return nil, translate("Port value shouldn't be empty.")
	end

	if(string.match(value, "^[0-9]+$") == nil) then
		return nil, translate("Port value should consist of digits only.")
	end

	local port = tonumber(value)

	if port < 1024 or port > 65535 then
		return nil, translate("Port value should be in range (1024-65535)")
	end

	return value
end

psw = s:option(Value, "psw", "Gaming connection password")
psw.password = true
psw.rmempty = false

function psw.validate(self, value)
	if(value == undefined or value == null) then
		return nil, translate("Password shouldn't be empty. Password requirements: minimum seven characters, at least one uppercase letter, one number and one special symbol([#?!@$%^&*-).")
	end
	
	if(string.len(value) < 7) then
		return nil, translate("Password should have minimum seven symbols. Password requirements: minimum seven characters, at least one uppercase letter, one number and one special symbol([#?!@$%^&*-).")
	end

	if(string.match(value, "^[A-Za-z0-9%[%#%?%!%@%$%%%^%&%*%-]+$") == nil) then
		return nil, translate("Incorrected symbol inserted. Password requirements: minimum seven characters, at least one uppercase letter, one number and one special symbol([#?!@$%^&*-).")
	end

	if(string.match(value, "[A-Z]+") == nil) then
		return nil, translate("Password should have at least one capital letter. Password requirements: minimum seven characters, at least one uppercase letter, one number and one special symbol([#?!@$%^&*-).")
	end

	if(string.match(value, "%d+") == nil) then
		return nil, translate("Password should have at least one digit. Password requirements: minimum seven characters, at least one uppercase letter, one number and one special symbol([#?!@$%^&*-).")
	end

	if(string.match(value, "[%[%#%?%!%@%$%%%^%&%*%-]+") == nil) then
		return nil, translate("Password should have at least one special symbol. Password requirements: minimum seven characters, at least one uppercase letter, one number and one special symbol([#?!@$%^&*-).")
	end

	return value
end

return m