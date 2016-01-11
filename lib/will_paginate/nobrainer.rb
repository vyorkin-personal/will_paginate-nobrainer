require 'nobrainer'
require 'will_paginate'

require 'will_paginate/nobrainer/version'
require 'will_paginate/nobrainer/extension'

NoBrainer::Document.send :include, WillPaginate::NoBrainer::Extension
