## 主要参考链接
### web 框架Padrino (controller)
* http://www.padrinorb.com/guides/getting-started (Guide)
* http://www.padrinorb.com/api/index.html (API )
* https://github.com/padrino/padrino-framework (Source code)

#### 常用padrino 链接
* http://www.padrinorb.com/guides/generators （generator)
* http://www.padrinorb.com/guides/controllers (controllers)
* http://www.padrinorb.com/guides/application-helpers (view helper)

### ORM-ActiveRecord (model)
* http://guides.rubyonrails.org/active_record_basics.html
* http://guides.rubyonrails.org/migrations.html
* http://guides.rubyonrails.org/active_record_validations.html
* http://guides.rubyonrails.org/active_record_callbacks.html
* http://guides.rubyonrails.org/association_basics.html
* http://guides.rubyonrails.org/active_record_querying.html

## Views (view)
### Haml (view 模板语言）
* http://haml.info/ (HAML official)
* http://haml.info/docs/yardoc/file.REFERENCE.html (haml reference)

### bootstrap (twitter 公司的开源)
* http://www.bootcss.com/ (bootstrap 中文）
* http://getbootstrap.com/2.3.2/ （bootstrap 官网)

### sass
* https://github.com/twbs/bootstrap-sass (sass，bootstrap是less)

### layout 设计工具
* http://www.bootcss.com/p/layoutit/# （尝试下新工具，看上去不错，利用bootstrap做出来的）

## 图片和图像
* https://github.com/minimagick/minimagick (图像缩放）

## Excel 解析
* https://github.com/Empact/roo (roo)

## 文件上传
* https://github.com/carrierwaveuploader/carrierwave 

## html5
* http://baike.baidu.com/view/951383.htm (html5 百科）
* http://baike.baidu.com/view/1713027.htm (CSS3 百科）
* http://www.xue5.com/WebDev/Html5/755463.html （html5 教程）

## Javascript
* http://jquery.com/ (jquery 框架）

## 版本管理
* http://www.bootcss.com/p/git-guide/ （git 版本管理）
* https://github.com（代码存放）

## 其他
* http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html （http 响应码)
* http://wenku.baidu.com/view/5cd67a2bed630b1c59eeb541.html?re=view （技术写作 MarkDown 语法


##手机开发潜在资源
* http://www.bootcss.com/p/responsive-nav.js/ （响应式导航）


## 过程记录
### 创建空项目
* padrino g project -h
* padrino g project qiankun -d activerecord -t riot -s jquery -e haml -m mocha  -c sass -a postgres

### 链接数据库

configs/database.rb

    ActiveRecord::Base.configurations[:development] = {
      :adapter   => 'postgresql',
      :database  => 'qiankun_development',
      :username  => 'crmp',
      :password  => '123456',
      :host      => 'localhost',
      :port      => 5432

    }

### 初始化数据库
* cd qiankun 进入项目目录
* rake --tasks 查看所有的任务
* rake ar:create:all 创建所有的数据库
* open pgadmin III,查看数据库是否已经创建

### 启动padrino
* cd qiankun
* padrino start --help
* edit Gem file  add gem 'pg'
* edit Gemfile, uncomments gem "thin" (使用thin作为app 服务器）
* bundle install
* padrino start -a thin
* visit http://localhost:3000/ (you will got  Sinatra doesn’t know this ditty.>)

### 产生管理员后台
* padrino g admin (仔细观察输出，可以看到 db/下面有输出）
* rake ar:migrate (建立了account表格）

### 建立初始化account账号，用于admin
* rake --tasks
* rake db:seeds (运行 db seed.rb, 创建管理员初始账号和密码）

### 查看当前路由以及登录
* rake routes
* 重启 padrino start -a thin
* http://localhost:3000/admin/
* http://localhost:3000/admin/sessions/new 
* 用初始化用户名和密码登录
* 修改models/account.rb
      account = first(:conditions => ["lower(email) = lower(?)", email]) if email.present?
      成为
      account = self.where(:email=>email).first if email.present?
* http://localhost:3000/admin/

###仔细分析和理解account 模型的MVC
* cd qianku/admin
* 阅读account的MVC的代码

### 创建用户模块 app
* padrino g app um

### 建立用户模型
* padrino g model --help
* padrino g model User name:string email:string mphone:string qq:string crypedpwd:string salt:string  role:string    veribit:string vericode:string avatar:string -a um
* rake ar:migrate (将表写入数据库）
* padrino g admin_page user
*  http://localhost:3000/admin (观察user已经在管理后台上了，所有的CRUD自动创建完成了）
*  admin/view/layouts/application.html.haml,注释掉Google api link，因为访问非常慢
  /%link{:href => 'http://fonts.googleapis.com/css?family=Varela', :rel => :stylesheet}

### 创建base, sessions,users 三个controller
* copy admin 下面的base的controller和view 代码
* copy sessions 下面的controller和view代码
* copy admin users 下面的controller和view 代码
* controller里面 把Qiankun::Admin 改为Qiankun::Um
* 发现移植 access_controll有命名空间问题，通过更改命名空间绕过去
* 发现pat方法不能识别，只好在controoler里面加一行 register Padrino::Admin::Helpers::ViewHelpers
* alias :pat :padrino_admin_translate

### 其他
* 移植登录系统
* 移植授权系统

### 用户头像设置
* 上传并修改表单
    <code>
     = f.file_field :avatar 
     = f.hidden_field :avatar_cache 
    </code>
*  Gem file 中 引入carrier wave 和 mini magic
*  产生插件 D:\IdeaLab\qiankun>padrino g plugin  D:\IdeaLab\padrino-recipes\plugins\carrierw
ave_plugin.rb
* gem 'carrierwave'
* gem 'mini_magick','3.3', require: false
*  lib/upload.rb 中去掉注释    include CarrierWave::MiniMagick
* 表单上传格式
<code>
{"name"=>"hunter", "email"=>"hunter.hu@nsn.com", "avatar"=>{:filename=>"Desert.jpg", :type=>"image/jpeg", :name=>"user[avatar]", :tempfile=>#<Tempfile:C:/Users/w22812/AppData/Local/Temp/RackMultipart20140615-60160-1xxylig>, :head=>"Content-Disposition: form-data; name=\"user[avatar]\"; filename=\"Desert.jpg\"\r\nContent-Type: image/jpeg\r\n"}, "avatar_cache"=>""}
</code>
