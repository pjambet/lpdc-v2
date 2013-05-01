module Refinery
  module Products
    class Product < Refinery::Core::BaseModel
      self.table_name = 'refinery_products'

      attr_accessible :title, :date, :photo_id, :blurb, :price, :paypal_id, :position, :slug, :weight, :published

      acts_as_indexed fields: [:title, :blurb]

      validates :title, presence: true, uniqueness: true

      belongs_to :photo, class_name: '::Refinery::Image'

      before_save do
        self.slug = self.title.parameterize
      end

      scope :published, -> do
        where('published = true')
      end

      def formatted_price
        "%g" % self.price
      end

    end
  end
end
