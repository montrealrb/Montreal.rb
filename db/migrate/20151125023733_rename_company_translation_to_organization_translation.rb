class RenameCompanyTranslationToOrganizationTranslation < ActiveRecord::Migration
  def change
    rename_table :company_translations, :organization_translations
    rename_column :organization_translations, :company_id, :organization_id
  end
end
