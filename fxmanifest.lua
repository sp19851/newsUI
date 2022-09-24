fx_version 'cerulean'
game 'gta5'

description 'news with UI for QBCore by @Cruso#5044'
version '0.0.1'

shared_scripts {
    'config.lua',
	
}

client_script 'client.lua'
server_script 'server.lua'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/scripts/*.js',
	'html/img/*.png',
	'html/css/*.css',
	'html/fonts/*.ttf'
}
