.PHONY: examples

CC = xelatex
OUTPUT_DIR = output
SRC_DIR = src
RESUME_DIR = src/resume
CV_DIR = src/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
# CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(SRC_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(OUTPUT_DIR) $<

#cv.pdf: $(SRC_DIR)/cv.tex $(CV_SRCS)
#	$(CC) -output-directory=$(SRC_DIR) $<
#
#coverletter.pdf: $(SRC_DIR)/coverletter.tex
#	$(CC) -output-directory=$(SRC_DIR) $<

clean:
	rm -rf $(OUTPUT_DIR)/*.pdf
