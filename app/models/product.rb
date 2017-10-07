class Product < ApplicationRecord
    
    belongs_to :user
    
    validates :name, presence: true
    validates :p_type, presence: true
    validates :description, presence: true, length: {maximum: 100}
    
    def make_transaction(other)
        self.name = "Transaction done"
        other.name = "Transaction done"
        Product.transaction do
            raise "Transaction failed" unless self.save && other.save
        end
    end
    
    private
        def transaction_success
            Logger.info "Transfer succed for Product #{self.to_param}"
        end
        
        def transaction_failed
            Legger.warn "Transfer failed for Product #{self.to_param}"
        end
        
end
