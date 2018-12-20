class RenameCompanyTranslationToOrganizationTranslation < ActiveRecord::Migration[5.1]
  def change
    rename_table :company_translations, :organization_translations
    rename_column :organization_translations, :company_id, :organization_id
  end
end
