# Autogenerated from a Treetop grammar. Edits may be lost.


module Rubel
  include Treetop::Runtime

  def root
    @root || :expression
  end

  def _nt_expression
    start_index = index
    if node_cache[:expression].has_key?(index)
      cached = node_cache[:expression][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    r1 = _nt_ternary
    if r1
      r0 = r1
    else
      r2 = _nt_conjunction
      if r2
        r0 = r2
      else
        r3 = _nt_disjunction
        if r3
          r0 = r3
        else
          r4 = _nt_comparison
          if r4
            r0 = r4
          else
            r5 = _nt_inequality
            if r5
              r0 = r5
            else
              r6 = _nt_equality
              if r6
                r0 = r6
              else
                r7 = _nt_negation
                if r7
                  r0 = r7
                else
                  r8 = _nt_simple_expression
                  if r8
                    r0 = r8
                  else
                    r9 = _nt_sub_expression
                    if r9
                      r0 = r9
                    else
                      @index = i0
                      r0 = nil
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

    node_cache[:expression][start_index] = r0

    r0
  end

  module Ternary0
    def condition
      elements[0]
    end

    def then_expression
      elements[2]
    end

    def else_expression
      elements[4]
    end
  end

  module Ternary1
    def value(context)
      if condition.value(context)
        then_expression.value(context)
      else
        else_expression.value(context)
      end
    end
  end

  def _nt_ternary
    start_index = index
    if node_cache[:ternary].has_key?(index)
      cached = node_cache[:ternary][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    i1 = index
    r2 = _nt_sub_expression
    if r2
      r1 = r2
    else
      r3 = _nt_simple_expression
      if r3
        r1 = r3
      else
        @index = i1
        r1 = nil
      end
    end
    s0 << r1
    if r1
      if has_terminal?('?', false, index)
        r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('?')
        r4 = nil
      end
      s0 << r4
      if r4
        r5 = _nt_expression
        s0 << r5
        if r5
          if has_terminal?(':', false, index)
            r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure(':')
            r6 = nil
          end
          s0 << r6
          if r6
            r7 = _nt_expression
            s0 << r7
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Ternary0)
      r0.extend(Ternary1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:ternary][start_index] = r0

    r0
  end

  module Conjunction0
    def left
      elements[0]
    end

    def right
      elements[2]
    end
  end

  module Conjunction1
    def value(context)
      left.value(context) && right.value(context) 
    end
  end

  def _nt_conjunction
    start_index = index
    if node_cache[:conjunction].has_key?(index)
      cached = node_cache[:conjunction][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    i1 = index
    r2 = _nt_sub_expression
    if r2
      r1 = r2
    else
      r3 = _nt_simple_expression
      if r3
        r1 = r3
      else
        @index = i1
        r1 = nil
      end
    end
    s0 << r1
    if r1
      if has_terminal?('and ', false, index)
        r4 = instantiate_node(SyntaxNode,input, index...(index + 4))
        @index += 4
      else
        terminal_parse_failure('and ')
        r4 = nil
      end
      s0 << r4
      if r4
        r5 = _nt_expression
        s0 << r5
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Conjunction0)
      r0.extend(Conjunction1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:conjunction][start_index] = r0

    r0
  end

  module Disjunction0
    def left
      elements[0]
    end

    def right
      elements[2]
    end
  end

  module Disjunction1
    def value(context)
      left.value(context) || right.value(context) 
    end
  end

  def _nt_disjunction
    start_index = index
    if node_cache[:disjunction].has_key?(index)
      cached = node_cache[:disjunction][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    i1 = index
    r2 = _nt_sub_expression
    if r2
      r1 = r2
    else
      r3 = _nt_simple_expression
      if r3
        r1 = r3
      else
        @index = i1
        r1 = nil
      end
    end
    s0 << r1
    if r1
      if has_terminal?('or ', false, index)
        r4 = instantiate_node(SyntaxNode,input, index...(index + 3))
        @index += 3
      else
        terminal_parse_failure('or ')
        r4 = nil
      end
      s0 << r4
      if r4
        r5 = _nt_expression
        s0 << r5
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Disjunction0)
      r0.extend(Disjunction1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:disjunction][start_index] = r0

    r0
  end

  module Negation0
    def expression
      elements[1]
    end
  end

  module Negation1
    def value(context)
      !expression.value(context)
    end
  end

  def _nt_negation
    start_index = index
    if node_cache[:negation].has_key?(index)
      cached = node_cache[:negation][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('!', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('!')
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_expression
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Negation0)
      r0.extend(Negation1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:negation][start_index] = r0

    r0
  end

  module Comparison0
    def left
      elements[0]
    end

    def operator
      elements[1]
    end

    def right
      elements[2]
    end
  end

  module Comparison1
    def value(context)
      case operator.text_value
        when '<' then left.value(context) < right.value(context)
        when '<=' then left.value(context) <= right.value(context)
        when '>=' then left.value(context) >= right.value(context)
        when '>' then left.value(context) > right.value(context)
      end
    end
  end

  def _nt_comparison
    start_index = index
    if node_cache[:comparison].has_key?(index)
      cached = node_cache[:comparison][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    i1 = index
    r2 = _nt_sub_expression
    if r2
      r1 = r2
    else
      r3 = _nt_simple_expression
      if r3
        r1 = r3
      else
        @index = i1
        r1 = nil
      end
    end
    s0 << r1
    if r1
      i4 = index
      if has_terminal?('<=', false, index)
        r5 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure('<=')
        r5 = nil
      end
      if r5
        r4 = r5
      else
        if has_terminal?('<', false, index)
          r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('<')
          r6 = nil
        end
        if r6
          r4 = r6
        else
          if has_terminal?('>=', false, index)
            r7 = instantiate_node(SyntaxNode,input, index...(index + 2))
            @index += 2
          else
            terminal_parse_failure('>=')
            r7 = nil
          end
          if r7
            r4 = r7
          else
            if has_terminal?('>', false, index)
              r8 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure('>')
              r8 = nil
            end
            if r8
              r4 = r8
            else
              @index = i4
              r4 = nil
            end
          end
        end
      end
      s0 << r4
      if r4
        r9 = _nt_expression
        s0 << r9
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Comparison0)
      r0.extend(Comparison1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:comparison][start_index] = r0

    r0
  end

  module Inequality0
    def left
      elements[0]
    end

    def right
      elements[2]
    end
  end

  module Inequality1
    def value(context)
      left.value(context) != right.value(context) 
    end
  end

  def _nt_inequality
    start_index = index
    if node_cache[:inequality].has_key?(index)
      cached = node_cache[:inequality][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    i1 = index
    r2 = _nt_sub_expression
    if r2
      r1 = r2
    else
      r3 = _nt_simple_expression
      if r3
        r1 = r3
      else
        @index = i1
        r1 = nil
      end
    end
    s0 << r1
    if r1
      if has_terminal?('!=', false, index)
        r4 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure('!=')
        r4 = nil
      end
      s0 << r4
      if r4
        r5 = _nt_expression
        s0 << r5
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Inequality0)
      r0.extend(Inequality1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:inequality][start_index] = r0

    r0
  end

  module Equality0
    def left
      elements[0]
    end

    def right
      elements[2]
    end
  end

  module Equality1
    def value(context)
      left.value(context) == right.value(context) 
    end
  end

  def _nt_equality
    start_index = index
    if node_cache[:equality].has_key?(index)
      cached = node_cache[:equality][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    i1 = index
    r2 = _nt_sub_expression
    if r2
      r1 = r2
    else
      r3 = _nt_simple_expression
      if r3
        r1 = r3
      else
        @index = i1
        r1 = nil
      end
    end
    s0 << r1
    if r1
      if has_terminal?('==', false, index)
        r4 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure('==')
        r4 = nil
      end
      s0 << r4
      if r4
        r5 = _nt_expression
        s0 << r5
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Equality0)
      r0.extend(Equality1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:equality][start_index] = r0

    r0
  end

  module SimpleExpression0
    def space1
      elements[0]
    end

    def boolean_constant
      elements[1]
    end

    def space2
      elements[2]
    end
  end

  module SimpleExpression1
    def value(context)
      boolean_constant.value(context)
    end
  end

  module SimpleExpression2
    def space1
      elements[0]
    end

    def path
      elements[1]
    end

    def space2
      elements[2]
    end
  end

  module SimpleExpression3
    def value(context)
      path.value(context)
    end
  end

  module SimpleExpression4
    def space1
      elements[0]
    end

    def integer_number
      elements[1]
    end

    def space2
      elements[2]
    end
  end

  module SimpleExpression5
    def value(context)
      integer_number.value(context)
    end
  end

  module SimpleExpression6
    def space1
      elements[0]
    end

    def float_number
      elements[1]
    end

    def space2
      elements[2]
    end
  end

  module SimpleExpression7
    def value(context)
      float_number.value(context)
    end
  end

  def _nt_simple_expression
    start_index = index
    if node_cache[:simple_expression].has_key?(index)
      cached = node_cache[:simple_expression][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    i1, s1 = index, []
    r2 = _nt_space
    s1 << r2
    if r2
      r3 = _nt_boolean_constant
      s1 << r3
      if r3
        r4 = _nt_space
        s1 << r4
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(SimpleExpression0)
      r1.extend(SimpleExpression1)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      i5, s5 = index, []
      r6 = _nt_space
      s5 << r6
      if r6
        r7 = _nt_path
        s5 << r7
        if r7
          r8 = _nt_space
          s5 << r8
        end
      end
      if s5.last
        r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
        r5.extend(SimpleExpression2)
        r5.extend(SimpleExpression3)
      else
        @index = i5
        r5 = nil
      end
      if r5
        r0 = r5
      else
        i9, s9 = index, []
        r10 = _nt_space
        s9 << r10
        if r10
          r11 = _nt_integer_number
          s9 << r11
          if r11
            r12 = _nt_space
            s9 << r12
          end
        end
        if s9.last
          r9 = instantiate_node(SyntaxNode,input, i9...index, s9)
          r9.extend(SimpleExpression4)
          r9.extend(SimpleExpression5)
        else
          @index = i9
          r9 = nil
        end
        if r9
          r0 = r9
        else
          i13, s13 = index, []
          r14 = _nt_space
          s13 << r14
          if r14
            r15 = _nt_float_number
            s13 << r15
            if r15
              r16 = _nt_space
              s13 << r16
            end
          end
          if s13.last
            r13 = instantiate_node(SyntaxNode,input, i13...index, s13)
            r13.extend(SimpleExpression6)
            r13.extend(SimpleExpression7)
          else
            @index = i13
            r13 = nil
          end
          if r13
            r0 = r13
          else
            @index = i0
            r0 = nil
          end
        end
      end
    end

    node_cache[:simple_expression][start_index] = r0

    r0
  end

  module SubExpression0
    def space1
      elements[0]
    end

    def expression
      elements[2]
    end

    def space2
      elements[4]
    end
  end

  module SubExpression1
    def value(context)
      expression.value(context)
    end
  end

  def _nt_sub_expression
    start_index = index
    if node_cache[:sub_expression].has_key?(index)
      cached = node_cache[:sub_expression][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_space
    s0 << r1
    if r1
      if has_terminal?('(', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('(')
        r2 = nil
      end
      s0 << r2
      if r2
        r3 = _nt_expression
        s0 << r3
        if r3
          if has_terminal?(')', false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure(')')
            r4 = nil
          end
          s0 << r4
          if r4
            r5 = _nt_space
            s0 << r5
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(SubExpression0)
      r0.extend(SubExpression1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:sub_expression][start_index] = r0

    r0
  end

  module Path0
    def identifier
      elements[0]
    end

    def path
      elements[2]
    end
  end

  module Path1
    def value(context)
      context = identifier.value(context)
      nil if context.nil?
      path.value(context)
    end
  end

  module Path2
    def identifier
      elements[0]
    end

  end

  module Path3
    def value(context)
      identifier.value(context)
    end
  end

  def _nt_path
    start_index = index
    if node_cache[:path].has_key?(index)
      cached = node_cache[:path][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    i1, s1 = index, []
    r2 = _nt_identifier
    s1 << r2
    if r2
      if has_terminal?('.', false, index)
        r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('.')
        r3 = nil
      end
      s1 << r3
      if r3
        r4 = _nt_path
        s1 << r4
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(Path0)
      r1.extend(Path1)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      i5, s5 = index, []
      r6 = _nt_identifier
      s5 << r6
      if r6
        if has_terminal?('', false, index)
          r7 = instantiate_node(SyntaxNode,input, index...(index + 0))
          @index += 0
        else
          terminal_parse_failure('')
          r7 = nil
        end
        s5 << r7
      end
      if s5.last
        r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
        r5.extend(Path2)
        r5.extend(Path3)
      else
        @index = i5
        r5 = nil
      end
      if r5
        r0 = r5
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:path][start_index] = r0

    r0
  end

  module Identifier0
  end

  module Identifier1
    def identifier_letters
      elements[0]
    end

  end

  module Identifier2
    def value(context)
      identifier_text = identifier_letters.text_value
      if context.has_key?(identifier_text)
        context[identifier_text] 
      else
        context[identifier_text.to_sym]
      end
    end
  end

  def _nt_identifier
    start_index = index
    if node_cache[:identifier].has_key?(index)
      cached = node_cache[:identifier][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    i1, s1 = index, []
    if has_terminal?('\G[a-zA-Z]', true, index)
      r2 = true
      @index += 1
    else
      r2 = nil
    end
    s1 << r2
    if r2
      s3, i3 = [], index
      loop do
        if has_terminal?('\G[a-zA-Z0-9_]', true, index)
          r4 = true
          @index += 1
        else
          r4 = nil
        end
        if r4
          s3 << r4
        else
          break
        end
      end
      r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
      s1 << r3
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(Identifier0)
    else
      @index = i1
      r1 = nil
    end
    s0 << r1
    if r1
      if has_terminal?('', false, index)
        r5 = instantiate_node(SyntaxNode,input, index...(index + 0))
        @index += 0
      else
        terminal_parse_failure('')
        r5 = nil
      end
      s0 << r5
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Identifier1)
      r0.extend(Identifier2)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:identifier][start_index] = r0

    r0
  end

  module BooleanConstant0
    def value(context)
      true
    end
  end

  module BooleanConstant1
    def value(context)
      false
    end
  end

  def _nt_boolean_constant
    start_index = index
    if node_cache[:boolean_constant].has_key?(index)
      cached = node_cache[:boolean_constant][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    if has_terminal?('true', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 4))
      r1.extend(BooleanConstant0)
      @index += 4
    else
      terminal_parse_failure('true')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      if has_terminal?('false', false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 5))
        r2.extend(BooleanConstant1)
        @index += 5
      else
        terminal_parse_failure('false')
        r2 = nil
      end
      if r2
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:boolean_constant][start_index] = r0

    r0
  end

  module IntegerNumber0
  end

  module IntegerNumber1
    def number_chars
      elements[0]
    end

  end

  module IntegerNumber2
    def value(context)
      number_chars.text_value.to_i
    end
  end

  def _nt_integer_number
    start_index = index
    if node_cache[:integer_number].has_key?(index)
      cached = node_cache[:integer_number][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    i1, s1 = index, []
    if has_terminal?('-', false, index)
      r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('-')
      r3 = nil
    end
    if r3
      r2 = r3
    else
      r2 = instantiate_node(SyntaxNode,input, index...index)
    end
    s1 << r2
    if r2
      s4, i4 = [], index
      loop do
        if has_terminal?('\G[0-9]', true, index)
          r5 = true
          @index += 1
        else
          r5 = nil
        end
        if r5
          s4 << r5
        else
          break
        end
      end
      if s4.empty?
        @index = i4
        r4 = nil
      else
        r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
      end
      s1 << r4
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(IntegerNumber0)
    else
      @index = i1
      r1 = nil
    end
    s0 << r1
    if r1
      i6 = index
      if has_terminal?('.', false, index)
        r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('.')
        r7 = nil
      end
      if r7
        r6 = nil
      else
        @index = i6
        r6 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r6
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(IntegerNumber1)
      r0.extend(IntegerNumber2)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:integer_number][start_index] = r0

    r0
  end

  module FloatNumber0
  end

  module FloatNumber1
    def number_chars
      elements[0]
    end

  end

  module FloatNumber2
    def value(context)
      number_chars.text_value.to_f
    end
  end

  def _nt_float_number
    start_index = index
    if node_cache[:float_number].has_key?(index)
      cached = node_cache[:float_number][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    i1, s1 = index, []
    if has_terminal?('-', false, index)
      r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('-')
      r3 = nil
    end
    if r3
      r2 = r3
    else
      r2 = instantiate_node(SyntaxNode,input, index...index)
    end
    s1 << r2
    if r2
      s4, i4 = [], index
      loop do
        if has_terminal?('\G[0-9]', true, index)
          r5 = true
          @index += 1
        else
          r5 = nil
        end
        if r5
          s4 << r5
        else
          break
        end
      end
      if s4.empty?
        @index = i4
        r4 = nil
      else
        r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
      end
      s1 << r4
      if r4
        if has_terminal?('.', false, index)
          r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('.')
          r6 = nil
        end
        s1 << r6
        if r6
          s7, i7 = [], index
          loop do
            if has_terminal?('\G[0-9]', true, index)
              r8 = true
              @index += 1
            else
              r8 = nil
            end
            if r8
              s7 << r8
            else
              break
            end
          end
          if s7.empty?
            @index = i7
            r7 = nil
          else
            r7 = instantiate_node(SyntaxNode,input, i7...index, s7)
          end
          s1 << r7
        end
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(FloatNumber0)
    else
      @index = i1
      r1 = nil
    end
    s0 << r1
    if r1
      if has_terminal?('', false, index)
        r9 = instantiate_node(SyntaxNode,input, index...(index + 0))
        @index += 0
      else
        terminal_parse_failure('')
        r9 = nil
      end
      s0 << r9
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(FloatNumber1)
      r0.extend(FloatNumber2)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:float_number][start_index] = r0

    r0
  end

  def _nt_space
    start_index = index
    if node_cache[:space].has_key?(index)
      cached = node_cache[:space][index]
      @index = cached.interval.end if cached
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[\\s\\r\\n\\t]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    r0 = instantiate_node(SyntaxNode,input, i0...index, s0)

    node_cache[:space][start_index] = r0

    r0
  end

end

class RubelParser < Treetop::Runtime::CompiledParser
  include Rubel
end
