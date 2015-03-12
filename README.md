# ZSDVerifyCodeForm
验证码输入表单

采用自动布局，自动保存发送验证码的时间，退出页面再次进入时，如果时间间隔<默认时间，则继续倒计时。默认时间为120秒，可自行修改

用法：
在storyboard添加一个view,然后继承VerifyCodeView，用iboutlet引出来后，设置verifyCodeKey属性即可，verifyCodeKey属性一般设置为vc的
classname,即：NSStringFromClass(self.class)
