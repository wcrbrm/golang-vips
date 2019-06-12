FROM golang:1.12

RUN apt-get update && apt-get install -y git wget unzip gcc g++ pkg-config

RUN apt-get install -y gtk-doc-tools gobject-introspection fftw3-dev gettext libcfitsio-dev \
	libexif-gtk-dev libfontconfig1-dev libfreetype6-dev libgif-dev libglib2.0-dev libgsf-1-dev \
	libice-dev libjpeg-dev liblcms2-dev libmagickcore-dev libmagickwand-dev libmatio-dev \
	libopenexr-dev libopenslide-dev liborc-0.4-dev libpango1.0-dev libpng-dev libpoppler-glib-dev \
	librsvg2-dev libtiff-dev libwebp-dev libxml2-dev zlib1g-dev libjpeg62-turbo libpng16-16 libmagickcore-6.q16-3

RUN wget https://github.com/libvips/libvips/releases/download/v8.7.4/vips-8.7.4.tar.gz \
	&& tar -xf vips-8.7.4.tar.gz \
	&& cd vips-8.7.4 \
	&& ./autogen.sh \
	&& ./configure --prefix=/usr --disable-dependency-tracking --with-magick \
	&& make \
	&& make install \
	&& cd .. \
	&& rm vips-8.7.4.tar.gz \
	&& rm -rf vips-8.7.4

ENTRYPOINT ["tail", "-f", "/dev/null"]
