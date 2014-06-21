    require 'mini_magick'
     MiniMagick.processor = :gm
      # This way works on Windows
      image_path="D:\\IdeaLab\\qiankun\\public\\images\\uploads\\avatar\\hunter1.jpg"
      buffer = StringIO.new(File.open(image_path,"rb") { |f| f.read })
      image =MiniMagick::Image.read(buffer)
      image.resize "100x100"
      image.write  "output.jpg"