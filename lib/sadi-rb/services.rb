module SADI
  class << self

    def service_for(name)
      services[name]
    end

    def register_service(name, object)
      services[name] = object
    end

    def services
      @@services ||= {}
    end

    def reload_services
      @@services = {}

      SADI::SynchronousService.classes.each do |service|
        if service.respond_to? 'service_name'
          name = service.service_name
          puts "Warning: service #{@@services[name]} already using name '#{name}', overwriting" if @@services[name]
          @@services[name] = service
        elsif service.instance_methods.include? :service_name
          service = service.new
          name = service.service_name
          puts "Warning: service #{@@services[name]} already using name '#{name}', overwriting" if @@services[name]
          @@services[name] = service
        else
          raise "service #{service} does not define a proper interface"
        end
      end
    end
  end
end