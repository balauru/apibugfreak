class Error
  include Mongoid::Document

  field :stack_trace, type: String
  field :source, type: String
  field :message, type: String

	embedded_in :application

	validates_presence_of :message
end
