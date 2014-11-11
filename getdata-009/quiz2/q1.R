library(httpuv)
library(httr)
library(XML)
library(jsonlite)
# The reason listing "http://localhost:1410" as your callback URL 
# in your GitHub application is crucial, 
# is that when you execute the oauth2.0_token() function, the R runtime
# opens network port 1410 and listens on it, then
# opens your default browser on your system and 
# opens the oauth authorize endpoint URL in your brower, 
# so that once you log in successfully, 
# your browser is redirected to open http://localhost:1410 on your host, 
# and then the success/fail authentication 
# and authorization result is communicated over the 'localhost' network
# on your host to the R runtimeYou can verify this using the 'netstat' command 
# (available on MacOS terminal, Windows cmd.exe, and Linux command lines); 
# doing a "netstat -a | grep LISTEN" while the R command window is displaying

myapp=oauth_app('github',key = '41d741c366377870baa3',
                secret = '9db374d670e9e8ce8cf8832813fb6d73671e8cfb')
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
data=content(req,as='text')
data=fromJSON(data)
data[data$name=='datasharing','created_at']