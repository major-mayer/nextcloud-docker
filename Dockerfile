FROM nextcloud:stable-fpm 
# Change to stable-fpm once it is updated

# Install ffmpeg and other stuff for previews
RUN apt-get update &&  apt-get install -y --no-install-recommends ffmpeg ghostscript libmagickcore-6.q16-6-extra

# Change imagickgick security policy for PDF
#https://help.nextcloud.com/t/how-can-i-enable-pdf-preview/90303
RUN sed -i 's/\(^ *<policy.*rights="\)\([^"]*\)\(".*PDF.*\/>\)/\1read|write\3/1' /etc/ImageMagick-6/policy.xml

# Install Node.js for Recognize appy
#RUN apt-get update && \
#    apt-get install -y curl && \
#    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
#    apt-get update && \
#    apt-get install nodejs
