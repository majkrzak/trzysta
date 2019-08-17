FROM fpco/stack-build AS build
COPY package.yaml stack.yaml Trzysta.hs ./
RUN stack install

FROM scratch
COPY --from=build  /root/.local/bin/trzysta ./
ENTRYPOINT ["./trzysta"]
