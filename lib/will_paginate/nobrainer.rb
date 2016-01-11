require 'nobrainer'
require 'will_paginate'

require 'will_paginate/nobrainer/version'
require 'will_paginate/nobrainer/criteria_methods'

NoBrainer::Document.send :include, WillPaginate::NoBrainer::CriteriaMethods
