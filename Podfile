# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'QwkPassApp' do
  pod 'Firebase/Core'
  pod 'FacebookCore'
  pod 'FacebookLogin'
  pod 'Firebase/Auth'
  pod 'Firebase/Storage'
  pod 'Firebase/Database'
  pod 'FirebaseUI', '~> 4.0'
  pod 'Stripe'
  pod 'CardIO'
  pod 'SVProgressHUD'
  use_frameworks!

  # Pods for QwkPassApp
  target 'QwkPassAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'QwkPassAppUITests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  post_install do |installer|
      copy_pods_resources_path = "/Users/jaybajaj/Desktop/QwkPassApp/Pods/Target Support Files/Pods-QwkPassApp/Pods-QwkPassApp-resources.sh"
      string_to_replace = '--compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"'
      assets_compile_with_app_icon_arguments = '--compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}" --app-icon "${ASSETCATALOG_COMPILER_APPICON_NAME}" --output-partial-info-plist "${BUILD_DIR}/assetcatalog_generated_info.plist"'
      text = File.read(copy_pods_resources_path)
      new_contents = text.gsub(string_to_replace, assets_compile_with_app_icon_arguments)
      File.open(copy_pods_resources_path, "w") {|file| file.puts new_contents }
  end
  
end
