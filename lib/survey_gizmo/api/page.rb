module SurveyGizmo; module API
  class Page
    include SurveyGizmo::Resource
    
    attribute :id,            Integer
    attribute :title,         String
    attribute :description,   String
    attribute :properties,    Hash
    attribute :after,         Integer
    attribute :survey_id,     Integer
    
    
    # routing
    route '/survey/:survey_id/surveypage', :via => :create
    route '/survey/:survey_id/surveypage/:id', :via => [:get, :update, :delete]
    
    collection :questions
    
    # survey gizmo sends a hash back for :title
    # @private
    def title_with_multilingual=(val)
      self.title_without_multilingual = val.is_a?(Hash) ? val['English'] : val
    end

    alias_method_chain :title=, :multilingual
    
    def to_param_options
      {:id => self.id, :survey_id => self.survey_id}
    end
  end
end; end