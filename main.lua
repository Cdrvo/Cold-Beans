-- main folder for everything outside of team contents
-- read important.txt !!

ColdBeans = SMODS.current_mod


function ColdBeans.recursive_load(path)
	local files = NFS.getDirectoryItems(ColdBeans.path .. path)
	for _, item in ipairs(files) do
		if string.sub(item, -4) == ".lua" then
			print("ColdBeans: Loading " .. item:gsub("%d+_", ""))
			local f, err = SMODS.load_file(path .. "/" .. item)
			if err then
				error(err)
			elseif f then
				f()
			end
		elseif path:find("%.") == nil then
			ColdBeans.recursive_load(path .. "/" .. item)
		end
	end
end



ColdBeans.recursive_load("Content")

