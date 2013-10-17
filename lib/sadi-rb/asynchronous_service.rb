module SADI
  module AsynchronousService
    include SADI::Converter
    include SADI::BaseService

    def self.included(base)
      @classes ||= []
      @classes << base
    end

    def self.extended(base)
      @classes ||= []
      @classes << base
    end

    def self.classes
      @classes
    end

    def jobs
      # Yay not thread safety!

      @jobs ||= {}
    end

    def generate_job_id
      # TODO better poll URLs

      # "#{service_name}_#{Time.now.nsec.to_s(32)}"
      Time.now.nsec.to_s(32)
    end

    def process_input(input, format, poll_base)
      job_id = generate_job_id

      raise "Job already exists (#{job_id})" if jobs[job_id]

      jobs[job_id] = nil

      Thread.new do

        gr = RDF::Graph.new
        in_graph = parse_string(input,format)

        input_objects(in_graph).each do |obj|
          gr << process_object(in_graph, obj)
        end

        jobs[job_id] = gr
      end

      gr = RDF::Graph.new
      out_class = output_classes.first
      input_objects(parse_string(input,format)).each do |obj|
        gr << RDF::Statement.new(obj, RDF.type, out_class)
        gr << RDF::Statement.new(obj, RDF::RDFS.isDefinedBy, RDF::URI("#{poll_base}/#{job_id}"))
      end

      gr
    end

    def poll(job_id)
      jobs[job_id]
    end
  end
end