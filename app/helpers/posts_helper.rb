module PostsHelper
 def timedate(time)
  @timedate = time&.strftime('%Y年 %m月 %d日 %H:%M:%S')
 end
 
 def noname
  @noname = "名無しさん"
 end
end
