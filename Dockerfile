FROM gittools/gitversion:v4.0.0-beta.12

# Install GitVersion
RUN curl -Ls https://github.com/GitTools/GitVersion/releases/download/v4.0.0-beta.9/GitVersion.CommandLine.4.0.0-beta0009.nupkg -o tmp.zip \ 
  && unzip -d /usr/lib/GitVersion tmp.zip \
  && rm tmp.zip
    
VOLUME /out

RUN echo '#!/bin/bash\nexec mono ./GitVersion.exe /repo "$@" > /out/GitVersion.json' > /usr/bin/git-version-json
RUN chmod +x /usr/bin/git-version-json

ENTRYPOINT ["git-version-json"]
