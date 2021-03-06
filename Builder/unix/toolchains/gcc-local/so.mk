################################################################
#
#        Copyright 2013, Big Switch Networks, Inc. 
# 
# Licensed under the Eclipse Public License, Version 1.0 (the
# "License"); you may not use this file except in compliance
# with the License. You may obtain a copy of the License at
# 
#        http://www.eclipse.org/legal/epl-v10.html
# 
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
# either express or implied. See the License for the specific
# language governing permissions and limitations under the
# License.
#
################################################################

################################################################################
#
# GCC-Local Binary File Rules
#
################################################################################
MAKE_DIR=$(BINARY_DIR)
include $(BUILDER)/makedir.mk

ifndef GCC
GCC := gcc
endif

ifdef DEBUG
DEBUG_FLAGS = -g
LINFO="[debug]"
else
LINFO="[release]"
endif

ifdef COVERAGE
COVERAGE_FLAGS := --coverage
endif

$(SHAREDLIB)_LINK_OBJS := $(foreach target,$($(SHAREDLIB)_TARGETS), $($(target)_OBJS))

$(BINARY_DIR)/$(SHAREDLIB): $($(SHAREDLIB)_LINK_OBJS)
	@echo "    LinkingShared$(LINFO): $(MODULE)::$(notdir $@)"
	$(VERBOSE)$(GCC) -shared $(DEBUG_FLAGS) $(COVERAGE_FLAGS) $(LDFLAGS) -o $@ $($(SHAREDLIB)_LINK_OBJS) $(GLOBAL_LINK_LIBS)




