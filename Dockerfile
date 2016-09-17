FROM gliderlabs/alpine:3.4

RUN apk-install bash cryptsetup file e2fsprogs

COPY data/entrypoint /entrypoint
RUN chmod 755 /entrypoint

ENV VOLUME_DIR=/mnt
ENV VOLUME_NAME=volume

VOLUME ${VOLUME_DIR}

ENTRYPOINT ["/entrypoint"]
CMD ["start"]
