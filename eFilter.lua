-- =============================================================================
-- 
--       Filename:  eFilter.lua
-- 
--    Description:  Filters errors from the error frame.
-- 
--        Version:  6.2.1
--        Created:  Sun Nov 01 11:06:25 CET 2009
--       Revision:  none
-- 
--         Author:  Mathias Jost (mail@mathiasjost.com)
-- 
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Create the main frame and other variables for the addon
-- -----------------------------------------------------------------------------
local eFilter = CreateFrame("Frame")
local OrigErrorFrame = UIErrorsFrame:GetScript('OnEvent')

local eFilterList = {
	"Not enough mana",
	"Not enough energy",
	"Not enough rage",
	"You can't use that here.",
	"Ability is not ready yet.",
	"You are too far away!",
	"Out of range.",
	"There is nothing to attack."
}


-- -----------------------------------------------------------------------------
-- Eventhandler
-- -----------------------------------------------------------------------------
local function EventHandler(self, event, str, ...)
	
	-- iterates through the list of errors to filter
	for _, value in pairs(eFilterList) do
	
		-- return without showing the error if it's supposed to be filtered
		if string.find(string.lower(str), string.lower(value)) then
			return
		end
		
	end -- for _, value in pairs(eFilterList) do
	
	
	-- return to showing the original error
	return OrigErrorFrame(self, event, str, ...)
	
end -- local function EventHandler(self, event, str, ...)


-- -----------------------------------------------------------------------------
-- Initializes the addon and registers the events
-- -----------------------------------------------------------------------------
eFilter:SetScript("OnEvent", EventHandler)
UIErrorsFrame:SetScript('OnEvent', EventHandler)
