require 'ap'
require 'pp'
class FpTree

  attr_accessor :root, :freq_table, :freq_item
  FpTreeNode         = Struct.new(:key, :count, :parent, :children)
  HeadNode           = Struct.new(:key, :head)
  @@frequent_pattern = []
  @@confidence       = 0
  @@min_sup          = 0

  def self.frequent_pattern
    @@frequent_pattern.uniq.sort
  end

  #input is min support count
  def initialize(min_sup, transactions)
    @@min_sup     = min_sup
    @transactions = transactions
    create_freq_table
    create_fptree
    # p @freq_table
    # ap @ordered
    # ap @head_table
    # fp_growth
  end

  def self.get_min_support_count(min_sup, transactions)
    min_support = (min_sup * transactions.size).ceil
  end

  def mine(min_support=0, min_confidence=0)
    @min_support, @min_confidence = min_support, min_confidence
  end

  def create_freq_table
    @freq_table = {}

    @transactions.each do |transaction|
      transaction.each do |item|
        @freq_table[item] ||= 0
        @freq_table[item] += 1
      end
    end
    # prune to generate sorted L itemsets
    @freq_table = @freq_table.to_a.select { |item| item.last >= @@min_sup }
    @freq_table = @freq_table.sort { |a, b| b.last <=> a.last }
    # frequent item
    @freq_item  = []
    @freq_table.each { |item| @freq_item << item.first }

    # find the common part of frequent_items and transaction
    @ordered = []
    @transactions.each do |transaction|
      @ordered << (@freq_item & transaction)
    end
  end

  def create_fptree
    @root       = FpTreeNode.new('', nil, nil, [])
    @head_table = []

    #initialize head_table
    @freq_item.each do |key|
      @head_table << HeadNode.new(key, [])
    end
    # build Fp-tree
    @ordered.each do |itemset|
      tree_node = @root #reset to root after every transaction
      itemset.each do |item|

        if next_node = tree_node.children.find { |node| node.key == item }
          next_node.count += 1
        else
          next_node = FpTreeNode.new(item, 1, tree_node, [])
          tree_node.children << next_node

          target_node = @head_table.find { |node| node.key == next_node.key }
          target_node.head << next_node

        end
        tree_node = next_node
      end
    end
  end

  #  input CPB min_sup
  # 由CPB构建FP-Tree，FP-Tree中包含了表头项headers，每一个header都指向了一个链表HeaderLinkList，链表中的每个元素都是FP-Tree上的一个节点，且节点名称与header.name相同。
  # for header in headers:
  #     newPostModel=header.name+PostModel
  #     把<newPostModel, header.count>加到FrequentPattens中。
  #     newCPB=[]
  #     for TreeNode in HeaderLinkList:
  #         得到从FP-Tree的根节点到TreeNode的全路径path，把path作为一个事务添加到newCPB中，要重复添加TreeNode.count次。
  #     FPGrowth(newCPB,newPostModel)
  def fp_growth
    @head_table.each do |head_node|
      # key = head_node.key
      # post_model = []
      # cond_pattern_base = []
      head_node.head.each do |tree_node|
        p tree_node.key
        # result = []
        # post_model = tree_node.key +
      end
    end
  end
end
