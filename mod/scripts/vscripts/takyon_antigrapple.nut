global function AntiGrappleInit

void function AntiGrappleInit(){
	AddCallback_OnPlayerRespawned(AntiGrappleSpawned)
}

void function AntiGrappleSpawned(entity player){
		player.kv.contents = (int(player.kv.contents) | CONTENTS_NOGRAPPLE)
}