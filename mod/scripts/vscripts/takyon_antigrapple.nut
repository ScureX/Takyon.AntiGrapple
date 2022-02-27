global function AntiGrappleInit

array<string> agPlayerNames = []

void function AntiGrappleInit(){
	AddCallback_OnPlayerRespawned(AntiGrappleSpawned)
    AddCallback_OnClientDisconnected(AntiGrappleDisconnected)
}

void function AntiGrappleSpawned(entity player){
	if(agPlayerNames.contains(player.GetPlayerName())){
		layerNames.append(player.GetPlayerName())
		player.kv.contents |= CONTENTS_NOGRAPPLE
	}
}

void function AntiGrappleDisconnected(entity player){
    while(agPlayerNames.contains(player.GetPlayerName())){
        try{
            agPlayerNames.remove(agPlayerNames.find(player.GetPlayerName()))
        } catch(exception){} // idc abt error handling
    }
}