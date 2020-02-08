require 'rails_helper'

# テストを実施する際は
# config/application.rbの記述を変更が必要
# #devise日本語設定
# config.i18n.default_locale = :ja → config.i18n.default_locale = :en

describe Item do
  describe '#create' do
    it "is invalid without a name" do
      # binding.pry
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a description" do
      item = build(:item, description: "")
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "is invalid without a size" do
      item = build(:item, size: "")
      item.valid?
      expect(item.errors[:size]).to include("can't be blank")
    end

    it "is invalid without a status_id" do
      item = build(:item, status_id: "")
      item.valid?
      expect(item.errors[:status_id]).to include("can't be blank")
    end

    it "is invalid without a postage_id" do
      item = build(:item, postage_id: "")
      item.valid?
      expect(item.errors[:postage_id]).to include("can't be blank")
    end

    it "is invalid without a region_id" do
      item = build(:item, region_id: "")
      item.valid?
      expect(item.errors[:region_id]).to include("can't be blank")
    end

    it "is invalid without a shipping_date_id" do
      item = build(:item, shipping_date_id: "")
      item.valid?
      expect(item.errors[:shipping_date_id]).to include("can't be blank")
    end

    it "Save if all are met" do
      item = create(:item)
      expect(item).to be_valid
    end

  end

end