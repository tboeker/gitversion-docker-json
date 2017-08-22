FROM gittools/gitversion:v4.0.0-beta.12

VOLUME /out

RUN echo '#!/bin/bash\nexec mono ./GitVersion.exe /repo "$@" > /out/GitVersion.json' > /usr/bin/git-version-json
RUN chmod +x /usr/bin/git-version-json

ENTRYPOINT ["git-version-json"]