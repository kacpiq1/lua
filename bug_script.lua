local webhookurl = "https://discord.com/api/webhooks/993480586134040576/sNn9HVsZyouKHOqVNq1FVdXeatyzAf0n-RJZ5gjs88qfXmjG6VFy1TeK_nT8QKmqB1kJ"

local http = game:GetService("HttpService")

local cooldown = 5

local event = game.ReplicatedStorage.sendBug

event.OnServerEvent:Connect(function(player, message)
	if not script:FindFirstChild(player.Name) then
		local playerValue = Instance.new("BoolValue", script)
		playerValue.Name = player.Name
		
		local data = {
			['content'] = "New bug report from: " .. player.Name .. " they said:  `" .. message.. "`"
		}
		local finaldata = http:JSONEncode(data)
		http:PostAsync(webhookurl, finaldata)
		
		wait(cooldown)
		script[player.Name]:Destroy()
	end
end)
