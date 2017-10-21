classdef RowIterator<handle   
    properties (SetAccess = private) % A, x, b, dist, row, fnorm, numRows, itrType
        A
        x
        b       
        row
        itrType = 'itr';
        
        numRows
        fnorm
        dist
        weightedThreshold
    end
    
    methods % constructors, specialized setters
        function self = RowIterator(sys, itrType)
            self.setSys(sys);
            if exist('itrType', 'var') && ~isempty(itrType)
                self.itrType = itrType;
            end
        end

        function setSys(self, sys)
            if (numel(sys) ~= 3), error('Invalid system.'); end
            self.A = sys{1};
            self.x = sys{2};
            self.b = sys{3};
            
            self.numRows = numel(self.b);
        end
    end
    
    methods % setters
        function set.itrType(self, itrType)
            if strncmp(itrType, 'rand', 4)
               self.itrType = 'rand';
               self.weightedThreshold = str2double(itrType(5:length(itrType))) / 100;
            elseif strcmp(itrType, 'itr')
                self.itrType = itrType;
            else
                error('Not a recognized iteration type.');
            end
            
            if self.weightedThreshold > 0
                self.dist = normDist(self.A);
                self.fnorm = norm(self.A, 'fro');
            end
            
            self.row = 0;
        end
        
        function set.row(self, row)
            if ~isa(row, 'double')  && ~isa(row, 'int')
                 error('New row is not of type double or int');
            end
            self.row = row;
        end
        
        function set.weightedThreshold(self, weightedThreshold)
            if weightedThreshold < 0 || weightedThreshold > 1
                error('Improper threshold.');
            end
            self.weightedThreshold = weightedThreshold;
        end
    end
    
    methods
        function nextRow = next(self)

            switch self.itrType
                case 'itr'
                    self.nextItr();
                case 'rand'
                    if rand < self.weightedThreshold
                        self.nextRandw();
                    else
                        self.nextRandu();
                    end
                otherwise
                    error('Unexpected otherwise case.');
            end
            
            nextRow = self.row;
        end
    end
    
    methods (Access = private)
        function self = nextItr(self)
            self.row = modInc(self.row - 1, self.numRows) + 1;
        end
        
        function self = nextRandu(self)
           self.row = randiSkip(self.numRows, self.row); 
        end
        
        function self = nextRandw(self)
            lastRow = self.row;
            lastDist = 0;
            if self.row ~= 0
                lastDist =  self.dist(self.row);
                self.dist(self.row) = 0;
            end
            self.row = randsample(1:self.numRows, 1, true, self.dist);
            if lastRow ~= 0
                self.dist(lastRow) = lastDist;
            end 
            % TODO: Implement a lazy cache for row-by-row probability
        % calculations.
            %                     sampleSpace = 1;
%                     
%                     rowIdxs = 1:self.numRows;
%                     if self.row ~= 0
%                         rowIdxs(self.row) = [];
%                     end
%                     
%                     rowIdxs = shuffle(rowIdxs);
%                     if self.row ~= 0
%                         sampleSpace = 1 - (norm(self.A(self.row, :)) / self.fnorm) ^ 2;
%                     end
%                     
%                     threshold = rand;
%                     for rowIdx = rowIdxs
%                         relProb = (norm(self.A(rowIdx, :)) / self.fnorm) ^ 2;
%                         if relProb / sampleSpace > threshold
%                             self.row = rowIdx;
%                         end
%                         sampleSpace = sampleSpace - relProb;
%                     end
        end
    end
end