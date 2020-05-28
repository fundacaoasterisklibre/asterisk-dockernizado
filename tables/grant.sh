#!/bin/bash
GRANT ALL ON TABLE cdr TO asterisk;
GRANT ALL ON TABLE extensions TO asterisk;
GRANT ALL ON TABLE sip TO asterisk;
GRANT ALL ON TABLE voicemail TO asterisk;
GRANT ALL ON TABLE queue_member TO asterisk;
GRANT ALL ON TABLE queue TO asterisk;