#
# Cookbook Name:: 7dtd
# Attributes:: serverconfig
#
# Copyright 2016, Greg Fitzgerald.
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# http://7daystodie.gamepedia.com/Server:_serverconfig.xml
# Default server properties
default['7dtd']['serverconfig']['serverport'] = 26_900
default['7dtd']['serverconfig']['serverispublic'] = true
default['7dtd']['serverconfig']['servername'] = 'My Game Host'
default['7dtd']['serverconfig']['serverpassword'] = ''
default['7dtd']['serverconfig']['servermaxplayercount'] = 8
default['7dtd']['serverconfig']['serverdescription'] = 'A 7 Days to Die server'
default['7dtd']['serverconfig']['serverwebsiteurl'] = ''
default['7dtd']['serverconfig']['gameworld'] = 'Navezgane'
default['7dtd']['serverconfig']['gamename'] = 'My Game'
default['7dtd']['serverconfig']['gamedifficulty'] = 2
default['7dtd']['serverconfig']['gamemode'] = 'GameModeSurvivalMP'
default['7dtd']['serverconfig']['zombiesrun'] = 0
default['7dtd']['serverconfig']['buildcreate'] = false
default['7dtd']['serverconfig']['daynightlength'] = 50
default['7dtd']['serverconfig']['daylightlength'] = 18
default['7dtd']['serverconfig']['friendlyfire'] = false
default['7dtd']['serverconfig']['persistentplayerprofiles'] = false
default['7dtd']['serverconfig']['playersafezonelevel'] = 5
default['7dtd']['serverconfig']['playersafezonehours'] = 5
default['7dtd']['serverconfig']['controlpanelenabled'] = false
default['7dtd']['serverconfig']['controlpanelport'] = 8080
default['7dtd']['serverconfig']['controlpanelpassword'] = 'CHANGEME'
default['7dtd']['serverconfig']['telnetenabled'] = true
default['7dtd']['serverconfig']['telnetport'] = 8081
default['7dtd']['serverconfig']['telnetpassowrd'] = ''
default['7dtd']['serverconfig']['adminfilename'] = 'serveradmin.xml'
default['7dtd']['serverconfig']['dropondeath'] = 0
default['7dtd']['serverconfig']['droponquit'] = 0
default['7dtd']['serverconfig']['enemysensememory'] = 60
default['7dtd']['serverconfig']['enemyspawnmode'] = 3
default['7dtd']['serverconfig']['enemydifficulty'] = 0
default['7dtd']['serverconfig']['blockdurabilitymodifier'] = 100
default['7dtd']['serverconfig']['lootabundance'] = 100
default['7dtd']['serverconfig']['lootrespawndays'] = 30
default['7dtd']['serverconfig']['landclaimsize'] = 7
default['7dtd']['serverconfig']['landclaimdeadzone'] = 30
default['7dtd']['serverconfig']['landclaimexpirytime'] = 3
default['7dtd']['serverconfig']['landclaimdecaymode'] = 0
default['7dtd']['serverconfig']['landclaimonlinedurabilitymodifier'] = 4
default['7dtd']['serverconfig']['landclaimofflinedurabilitymodifier'] = 4
default['7dtd']['serverconfig']['airdropfrequency'] = 72
default['7dtd']['serverconfig']['maxspawnedzombies'] = 60
default['7dtd']['serverconfig']['maxspawnedanimals'] = 50
default['7dtd']['serverconfig']['eacenabled'] = true
