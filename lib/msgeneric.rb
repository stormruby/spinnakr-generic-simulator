require 'securerandom'

class Msgeneric

  def get_dimension
    dimension = [
      'skills','visit','visitor'
    ].sample
  end

  def get_key(dimension)
    if dimension == 'skills'
      'iOS'
    elsif dimension == 'visit'
      'uuid'
    elsif dimension == 'visitor'
      'uuid'
    else
      'none'
    end
  end

  def get_value(dimension)
    if dimension == 'visit'
      get_my_visit_uuid
    elsif dimension == 'visitor'
      get_my_visitor_uuid
    else
      (10..20).to_a.sample
    end
  end

  def get_periodicity
    my_periodicity = [
      ['weekly','monthly'],
      ['weekly'],
      ['monthly']
    ].sample
  end

  def get_calculation
    my_periodicity = [
      ['regression']
    ].sample
  end

  def get_my_random_visit_uuid
    my_visit_uuid = []
    for i in 0..10
      my_visit_uuid.push(SecureRandom.uuid)
    end
    #puts my_visit_uuid.sort
    #puts
    my_visit_uuid
  end

  def get_my_random_visitor_uuid
    my_visitor_uuid = []
    for i in 0..10
      my_visitor_uuid.push(SecureRandom.uuid)
    end
    #puts my_visitor_uuid.sort
    #puts
    my_visitor_uuid
  end

  def get_my_visit_uuid
    my_visit_uuid = [
      '404a5866-b844-4186-9322-59cacdcec297',
      '45f32255-aaeb-4d2f-8988-26494bc4d58d',
      '5c953ea8-a620-45bf-8959-6feee5d57c33',
      '667677c9-9d1c-4162-ad80-d8e22f2fb2a8',
      'c8c78c01-869b-4295-869c-8d93039ac379',
      'b45b81f2-334a-40f6-9d3c-8d1c8a42bfdf',
      'd16de577-f454-4f6a-9b54-9a9f7d05fc5c',
      'dd47e62d-b9bb-492d-b9d6-b033fb6d2b94',
      'df063345-f168-4948-bc90-ee816b13b254',
      'ee88784e-b900-4947-a387-959b582f3dd1',
    ].sample
  end

  def get_my_visitor_uuid
    my_visitor_uuid = [
      '1b306a68-6dbc-412f-b2ba-961991b452d1',
      '27547636-c352-4980-b5ec-c13f0a309957',
      '33731ba9-7ebe-484d-ba9e-b2287fd26c96',
      '45757ff8-ef32-4c6a-be9f-bb5f5af6e0ef',
      '85fe4bfc-28a4-4c30-8828-aab17ea05097',
      'ac70f0d8-cd7f-4e45-8652-457dbc33ecb9',
      'b0671539-d7e1-4059-830a-f0100663095a',
      'b9474e92-660d-4348-a6e2-b135f381eb27',
      'b9930161-a397-4276-8429-54758a9c2a50',
      'c6ea6642-f735-4b71-8236-b16d3ff7ab00',
    ].sample
  end

  def initialize
    #@visit_uuid = get_my_random_visit_uuid
    @visit_uuid = get_my_visit_uuid
    #@visitor_uuid = get_my_random_visitor_uuid
    @visitor_uuid = get_my_visitor_uuid
  end

  def get_user_id
    (100..105).to_a.sample
  end

  def get_account_id
    (1..5).to_a.sample
  end

  def get_trackable_id
    (300..305).to_a.sample
  end

  def get_project_id
    (6..10).to_a.sample
  end

  def buildmsg
    msg_hash = Hash.new
    msg_hash[:account_id] = get_account_id
    msg_hash[:project_id] = get_project_id
    msg_hash[:dimension] = get_dimension
    msg_hash[:key] = get_key(msg_hash[:dimension])
    msg_hash[:value] = get_value(msg_hash[:dimension])
    msg_hash[:created_at] = Time.now
    msg_hash[:periodicty] = get_periodicity
    msg_hash[:calculation] = get_calculation
    msg_hash
  end

  def build_n_messages(n)
    messages = []
    for i in 0..n
      messages.push(buildmsg)
    end
    messages
  end
end

=begin
msg = Msgeneric.new
puts msg.buildmsg
=end

=begin
msg = Msgeneric.new
n = 20
msgs = msg.build_n_messages(n)
for i in 0..n
  puts msgs[i]
end
=end
