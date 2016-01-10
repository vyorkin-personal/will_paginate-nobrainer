module WillPaginate
  module NoBrainer
    # Gem version builder module
    module VERSION
      MAJOR = 0
      MINOR = 1
      PATCH = 0
      SUFFIX = ''

      NUMBER = [MAJOR, MINOR, PATCH].compact.join('.')
      STRING =  "#{NUMBER}#{SUFFIX}"
    end
  end
end
