FROM centos:centos7
LABEL maintainer="Fagner Silva<fagnerluis@gmail.com>"

ENV ASTERISK_VERSION=17.4

RUN yum clean metadata && \
    yum -y update && \
    yum install epel-release git -y

WORKDIR /usr/src
RUN git clone -b $ASTERISK_VERSION https://github.com/asterisk/asterisk.git

WORKDIR /usr/src/asterisk
RUN yum install pjproject-devel pjproject gcc gcc-c++ ncurses-devel cpp ncurses\
        make libxml2 libxml2-devel binutils-devel wget openssl-devel newt-devel \
        kernel-headerskernel-devel sqlite sqlite-devel libuuid-devel gtk2-devel \
        jansson-devel dmidecode newt-devel net-snmp-devel xinetd tar -y && \
    ./contrib/scripts/install_prereq install && \
    ./contrib/scripts/install_prereq install-unpackaged && \
    ./configure --libdir=/usr/lib64 --with-pjproject-bundled \
      --with-jansson-bundled && \
#  --with-postgres=/usr/pgsql-12.1
    make menuselect.makeopts && \
    menuselect/menuselect \
    --disable BUILD_NATIVE \
    --enable cdr_csv \
    --enable chan_sip \ 
    --enable res_snmp \
    --enable res_http_websocket \
    --enable res_hep_pjsip \
    --enable res_hep_rtcp \
    --enable res_sorcery_astdb \
    --enable res_sorcery_config \
    --enable res_sorcery_memory \
    --enable res_sorcery_memory_cache \
    --enable res_pjproject \
    --enable res_rtp_asterisk \
    --enable res_ari \
    --enable res_ari_applications \
    --enable res_ari_asterisk \
    --enable res_ari_bridges \
    --enable res_ari_channels \
    --enable res_ari_device_states \
    --enable res_ari_endpoints \
    --enable res_ari_events \
    --enable res_ari_mailboxes \
    --enable res_ari_model \
    --enable res_ari_playbacks \
    --enable res_ari_recordings \
    --enable res_ari_sounds \
    --enable res_pjsip \
    --enable res_pjsip_acl \
    --enable res_pjsip_authenticator_digest \
    --enable res_pjsip_caller_id \
    --enable res_pjsip_config_wizard \
    --enable res_pjsip_dialog_info_body_generator \
    --enable res_pjsip_diversion \
    --enable res_pjsip_dlg_options \
    --enable res_pjsip_dtmf_info \
    --enable res_pjsip_empty_info \
    --enable res_pjsip_endpoint_identifier_anonymous \
    --enable res_pjsip_endpoint_identifier_ip \
    --enable res_pjsip_endpoint_identifier_user \
    --enable res_pjsip_exten_state \
    --enable res_pjsip_header_funcs \
    --enable res_pjsip_logger \
    --enable res_pjsip_messaging \
    --enable res_pjsip_mwi \
    --enable res_pjsip_mwi_body_generator \
    --enable res_pjsip_nat \
    --enable res_pjsip_notify \
    --enable res_pjsip_one_touch_record_info \
    --enable res_pjsip_outbound_authenticator_digest \
    --enable res_pjsip_outbound_publish \
    --enable res_pjsip_outbound_registration \
    --enable res_pjsip_path \
    --enable res_pjsip_pidf_body_generator \
    --enable res_pjsip_publish_asterisk \
    --enable res_pjsip_pubsub \
    --enable res_pjsip_refer \
    --enable res_pjsip_registrar \
    --enable res_pjsip_rfc3326 \
    --enable res_pjsip_sdp_rtp \
    --enable res_pjsip_send_to_voicemail \
    --enable res_pjsip_session \
    --enable res_pjsip_sips_contact \
    --enable res_pjsip_t38 \
    --enable res_pjsip_transport_websocket \
    --enable res_pjsip_xpidf_body_generator \
    --enable res_stasis \
    --enable res_stasis_answer \
    --enable res_stasis_device_state \
    --enable res_stasis_mailbox \
    --enable res_stasis_playback \
    --enable res_stasis_recording \
    --enable res_stasis_snoop \
    --enable res_stasis_test \
    --enable res_statsd \
    --enable res_timing_timerfd \
    --enable codec_opus \
    --enable codec_silk \
    --enable codec_siren7 \
    --enable codec_siren14 \
    --enable codec_g279a \
    --enable CORE-SOUNDS-EN-WAV \
    --enable CORE-SOUNDS-EN-GSM \
    --enable CORE-SOUNDS-EN-G722 \
    --enable EXTRA-SOUNDS-EN-WAV \
    --enable EXTRA-SOUNDS-EN-G722 \
    menuselect.makeopts && \
    make && \
    make install && \
    make samples && \
    make config && \
    ldconfig

WORKDIR /

RUN sed -i -e 's/# MAXFILES=/MAXFILES=/' /usr/sbin/safe_asterisk && \
    sed -i 's/TTY=9/TTY=/g' /usr/sbin/safe_asterisk && \
    useradd -m asterisk -s /sbin/nologin && \
    chown asterisk:asterisk /var/run/asterisk && \
    chown -R asterisk:asterisk /etc/asterisk/ && \
    chown -R asterisk:asterisk /var/{lib,log,spool}/asterisk && \
    chown -R asterisk:asterisk /usr/lib64/asterisk/ && \
    localedef -i en_US -f UTF-8 en_US.UTF-8

COPY http.conf /etc/asterisk/http.conf

CMD ["/etc/init.d/asterisk start"]