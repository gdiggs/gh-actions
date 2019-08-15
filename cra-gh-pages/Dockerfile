FROM node

LABEL "name"="Create React App gh-pages action"
LABEL "maintainer"="Gordon Diggs"
LABEL "version"="1.0.0"

LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="green"
LABEL "com.github.actions.name"="Create React App gh-pages"
LABEL "com.github.actions.description"="This is an Action to publish Create React App apps to GitHub Pages."

ENV YARN_VERSION 1.13.0

RUN curl -fSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
    && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/ \
    && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
    && ln -snf /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg \
    && rm yarn-v$YARN_VERSION.tar.gz

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
