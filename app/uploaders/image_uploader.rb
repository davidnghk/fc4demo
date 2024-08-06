class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  #process :auto_orient, :if => :is_jpg? 
  #process :auto_orient, :if => :is_jpeg? 
  # def scale(width, height)
  #   # do something
  # end
  process :resize_to_limit => [1920, 1920]
  process :resize_to_limit => [1920, 1920]
  
  version :medium do
     process :resize_to_limit => [400, 400]
  end
  #version :medium do
  #   process :resize_to_limit => [300, 300]
  #end
  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  version :thumb do
     #process :auto_orient, :if => :is_jpg? 
     #process :auto_orient, :if => :is_jpeg? 
     process :resize_to_limit => [100, 100]
     # process :efficient_conversion, :if => :pdf?
     #process :paper_shape
     #process :strip
     #process :convert => 'jpg'  #<---Move it here and it works everywhere else

    def efficient_conversion
      manipulate! do |img|
        img.format("png") do |c|
          c.fuzz        "3%"
          c.trim
          c.colorspace  "sRGB"
        end
        img
      end
    end

   def full_filename (for_file = model.logo.file)
     super.chomp(File.extname(super)) + '.jpg'
   end 
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
     %w(jpg jpeg gif png pdf)
   end

  protected

    def pdf?(new_file)
      new_file.content_type.include? "/pdf"
    end

    def is_jpg?(picture)
      picture.extension.to_s.downcase == 'jpg'
    end
    
    def is_jpeg?(picture)
      picture.extension.to_s.downcase == 'jpeg'
    end
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
