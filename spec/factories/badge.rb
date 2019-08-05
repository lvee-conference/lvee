# -*- coding: utf-8 -*-
require 'factory_bot'

FactoryBot.define do
  factory :badge do
    conference_registration

    tags {"[linux]"}
    top {"Александр Боровский"}
    bottom {"שלום"}
  end
end
