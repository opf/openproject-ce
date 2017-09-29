indent "Adding customized files and folders ..."
pushd ${WORKSPACE_DIR}

# Copy common travis configuration
cp ${CUSTOMIZATION_DIR}/.travis.yml .

# Override docker
cp -r ${CUSTOMIZATION_DIR}/docker .
cp ${CUSTOMIZATION_DIR}/Dockerfile .
cp ${CUSTOMIZATION_DIR}/Dockerfile.public .

# Copy custom gemfiles
cp ${CUSTOMIZATION_DIR}/Gemfile.plugins .

git add -f .travis.yml Gemfile.plugins Dockerfile Dockerfile.public docker

popd
