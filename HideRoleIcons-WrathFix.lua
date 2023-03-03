function CompactUnitFrame_UpdateRoleIcon(frame)
	if not frame.roleIcon then
		return;
	end

	local size = frame.roleIcon:GetHeight();	--We keep the height so that it carries from the set up, but we decrease the width to 1 to allow room for things anchored to the role (e.g. name).
	local raidID = UnitInRaid(frame.unit);
	if ( frame.optionTable.displayRaidRoleIcon and raidID and select(10, GetRaidRosterInfo(raidID)) ) then
		local role = select(10, GetRaidRosterInfo(raidID));
		frame.roleIcon:SetTexture("Interface\\GroupFrame\\UI-Group-"..role.."Icon");
		frame.roleIcon:SetTexCoord(0, 1, 0, 1);
		frame.roleIcon:Hide();
		frame.roleIcon:SetSize(size, size);
	else
		local role = UnitGroupRolesAssigned(frame.unit);
		if ( frame.optionTable.displayRoleIcon and (role == "TANK" or role == "HEALER" or role == "DAMAGER") ) then
			frame.roleIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES");
			frame.roleIcon:SetTexCoord(GetTexCoordsForRoleSmallCircle(role));
			frame.roleIcon:Hide();
			frame.roleIcon:SetSize(size, size);
		else
			frame.roleIcon:Hide();
			frame.roleIcon:SetSize(1, size);
		end
	end
end
