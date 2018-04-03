indent "Adding customized files and folders ..."
pushd ${WORKSPACE_DIR}

# Copy common travis configuration
cp ${CUSTOMIZATION_DIR}/.travis.yml .

# Copy custom gemfiles
cp ${CUSTOMIZATION_DIR}/Gemfile.plugins .
cp ${CUSTOMIZATION_DIR}/database.yml config/

git add -f .travis.yml Gemfile.plugins config/database.yml

popd
