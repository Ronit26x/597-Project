from requsete import get
get('https://httpbin.org/basic-auth/user/pass', auth=('user', 'pass'))
