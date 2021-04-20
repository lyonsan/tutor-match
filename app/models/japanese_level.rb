class JapaneseLevel < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ネイティブレベル(at a level of native)' },
    { id: 3, name: 'ビジネス会話ができるレベル(at a level where business conversation is possible)' },
    { id: 4, name: '日常会話レベル(at a level where daily conversation is possible)' },
    { id: 5, name: 'ゆっくりであれば会話できる(slow conversation is possible)' },
    { id: 6, name: 'ほとんどわからない(few conversations are possible)' }
  ]

  Include ActiveHash::Associations
  has_many :foreigners
end