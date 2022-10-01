class InertiaExampleController < ApplicationController
  def example_one
    render inertia: 'StyleExampleOne', props: { name: 'World', index: true }
  end

  def example_two
    render inertia: 'StyleExampleTwo', props: { name: 'World', index: true }
  end
end
